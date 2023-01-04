module ResponHelper
    def render_session(jwt, user)
        render json: {
            session: {
                user: user,
                jwt: jwt,
            }, status: 201
        }
    end

    def respon_logout
        render json: {
            message: 'Success Logout',
        }, status: :ok
    end

    def render_registration(resource)
        render json: {
            message: 'Registered Success',
            data: resource
        }, status: :ok
    end

    def render_response(resource)
        render json: {
            data: resource
        }, status: 200
    end

    def render_duplicate(email)
        return render json: {
            code: 204,
            message: "e-mail #{email} already in use",
        }, status: :ok
    end

    def render_fail_204
        render json: {
            code: 204,
        }, status: :ok
    end

    def render_fail_404
        render json: {
            code: 204,
        }, status: :ok
    end
end
