class ApplicationController < ActionController::API

    # Step 1: Encode/Decode Tokens 
    def encode_token(payload)
        # should store secret in env variable. 
        JWT.encode(payload, 'my_s3cr3t')
    end 

    def auth_header 
        # { Authorization: 'Bearer <token>' }
        request.headers['Authorization']
    end 

    # WHY?: `JWT.decode` takes three arguments as well: a JWT as a string, an application secret, and––optionally––a hashing algorithm.
    def decoded_token 
        if auth_header
            token = auth_header.split(' ')[1]
            # get token into a readable snippet, split at the space.
            begin 
                JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
            rescue JWT::DecodeError 
                nil 
            end 
        end 
    end 


    # Step 2: Authentication helper methods 
    def current_user 
        if decoded_token
            # JWT.decode => [{ "user_id"=> 1 }, { "alg"=>"HS256" }]
            # [0] gives us the payload { "user_id"=> 1 }
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end 
    end

    def logged_in? 
        !!current_user
        # returns a boolean instead of truthy user object.
    end 

    # Step 3: Authorization helper methods 
    def authorized 
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end 



end
