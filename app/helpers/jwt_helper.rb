module JwtHelper
    def encode_token(payload)
        JWT.encode(payload, 'ror_api')
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            # header: { 'Authorization': 'Bearer <token>' }
            begin
                JWT.decode(token, 'ror_api', true, algorithm: 'HS256')
                rescue JWT::DecodeError
                nil
            end
        end
    end

    def logged_in_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!logged_in_user
    end

    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end

    def gen_token(resource)
        token = encode_token({user_id: resource[:id]})
    end

    def user_id
        @data = decoded_token[0]['user_id']
    end


end
