import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from django.conf import settings

def send_email(subject, recipient, body):
    try:
        msg = MIMEMultipart()
        msg['From'] = settings.EMAIL_HOST_USER
        msg['To'] = recipient
        msg['Subject'] = subject

        msg.attach(MIMEText(body, 'plain'))

        server = smtplib.SMTP(settings.EMAIL_HOST, settings.EMAIL_PORT)
        server.starttls()
        server.login(settings.EMAIL_HOST_USER, settings.EMAIL_HOST_PASSWORD)
        text = msg.as_string()
        server.sendmail(settings.EMAIL_HOST_USER, recipient, text)
        server.quit()
    except Exception as e:
        raise Exception(f"Failed to send email: {str(e)}")

def send_booking_confirmation_email(booking):
    subject = "Booking Confirmation"
    recipient = booking.user.email
    body = f"Dear {booking.user.username},\n\nYour booking for {booking.destination.title} from {booking.start_date} to {booking.end_date} has been confirmed.\n\nThank you for choosing us!\n\nBest regards,\nDynamic Tourism Project"
    send_email(subject, recipient, body)

def send_notification_email(subject, recipient, message):
    body = f"Dear {recipient},\n\n{message}\n\nBest regards,\nDynamic Tourism Project"
    send_email(subject, recipient, body)
