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
    def decode_token 
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
end
