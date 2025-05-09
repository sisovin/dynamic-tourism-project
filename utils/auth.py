import jwt
from datetime import datetime, timedelta
from argon2 import PasswordHasher
from django.conf import settings
from rest_framework.exceptions import AuthenticationFailed

ph = PasswordHasher()

def hash_password(password):
    try:
        return ph.hash(password)
    except Exception as e:
        raise AuthenticationFailed(f"Password hashing failed: {str(e)}")

def generate_jwt_token(user):
    try:
        payload = {
            'user_id': user.id,
            'exp': datetime.utcnow() + timedelta(minutes=int(settings.JWT_ACCESS_TOKEN_LIFETIME)),
            'iat': datetime.utcnow()
        }
        return jwt.encode(payload, settings.JWT_SECRET_KEY, algorithm='HS256')
    except Exception as e:
        raise AuthenticationFailed(f"Token generation failed: {str(e)}")

def refresh_jwt_token(refresh_token):
    try:
        payload = jwt.decode(refresh_token, settings.JWT_SECRET_KEY, algorithms=['HS256'])
        payload['exp'] = datetime.utcnow() + timedelta(minutes(int(settings.JWT_ACCESS_TOKEN_LIFETIME)))
        return jwt.encode(payload, settings.JWT_SECRET_KEY, algorithm='HS256')
    except jwt.ExpiredSignatureError:
        raise AuthenticationFailed("Refresh token has expired")
    except jwt.InvalidTokenError:
        raise AuthenticationFailed("Invalid refresh token")

def verify_jwt_token(token):
    try:
        payload = jwt.decode(token, settings.JWT_SECRET_KEY, algorithms=['HS256'])
        return payload
    except jwt.ExpiredSignatureError:
        raise AuthenticationFailed("Token has expired")
    except jwt.InvalidTokenError:
        raise AuthenticationFailed("Invalid token")
