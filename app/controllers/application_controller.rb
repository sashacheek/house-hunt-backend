module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :require_authentication
  end

  class_methods do
    def allow_unauthenticated_access(**options)
      skip_before_action :require_authentication, **options
    end
  end

  private

    def require_authentication
      token = request.headers['Authorization']&.split(' ')&.last
      if token.present?
        Current.user = Lister.find_by(auth_token: token)
      end

      render json: { error: 'Unauthorized' }, status: :unauthorized unless Current.user
    end

    def authenticated?
      Current.user.present?
    end
end
