import os
from django.core.wsgi import get_wsgi_application
import sentry_sdk
from sentry_sdk.integrations.django import DjangoIntegration

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'my_project.settings')

sentry_sdk.init(
    dsn=os.getenv('SENTRY_DSN'),
    environment=os.getenv('SENTRY_ENVIRONMENT'),
    integrations=[DjangoIntegration()],
    traces_sample_rate=1.0,
    send_default_pii=True
)

application = get_wsgi_application()
