import smtplib
import os

from email.message import EmailMessage

from dotenv import load_dotenv

load_dotenv()

EMAIL_ADDRESS = os.getenv(
    "EMAIL_ADDRESS"
)

EMAIL_PASSWORD = os.getenv(
    "EMAIL_PASSWORD"
)


def send_photo_email(
    receiver_email,
    contact_name,
    image_path
):

    try:

        msg = EmailMessage()

        msg["Subject"] = (
            "SnapShare AI Photo Delivery"
        )

        msg["From"] = EMAIL_ADDRESS

        msg["To"] = receiver_email

        msg.set_content(
            f"""
Hello {contact_name},

You were detected in a group photo using SnapShare AI.

Your photo has been shared automatically.

Thank you for using SnapShare AI 🚀
"""
        )

        with open(
            image_path,
            "rb"
        ) as image_file:

            image_data = image_file.read()

            image_name = os.path.basename(
                image_path
            )

            msg.add_attachment(
                image_data,
                maintype="image",
                subtype="jpeg",
                filename=image_name
            )

        smtp = smtplib.SMTP_SSL(
            "smtp.gmail.com",
            465,
            timeout=10
        )

        smtp.login(
            EMAIL_ADDRESS,
            EMAIL_PASSWORD
        )

        smtp.send_message(msg)

        smtp.quit()

        print(
            "✅ Email sent successfully"
        )

    except Exception as e:

        print(
            "❌ Email sending failed:"
        )

        print(e)