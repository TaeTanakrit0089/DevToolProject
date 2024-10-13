from django import template
from django.utils.translation import gettext as _

register = template.Library()


# Custom translation tag to translate form errors to Thai


@register.filter(name='translate_error')
def translate_error(errors):
    if isinstance(errors, list):  # If errors are in list format
        return [translate_error(error) for error in errors]  # Translate each error
    elif isinstance(errors, str):  # If it's a single error string
        translations = {
            'The password is too similar to the username.': 'รหัสผ่านมีความคล้ายคลึงกับชื่อผู้ใช้มากเกินไป',
            'Please enter a correct username and password. Note that both fields may be case-sensitive.': 'กรุณากรอกชื่อผู้ใช้และรหัสผ่านที่ถูกต้อง โปรดทราบว่าทั้งสองฟิลด์อาจมีการตรวจสอบตัวพิมพ์ใหญ่และตัวพิมพ์เล็ก',
            'This field is required.': 'จำเป็นต้องกรอกข้อมูลในฟิลด์นี้',
            'Enter a valid email address.': 'กรุณากรอกอีเมลที่ถูกต้อง',
            'Date Of Birth Must Not Be Future': 'วันเกิดต้องไม่เป็นวันที่ในอนาคต',
            'Ensure this value has at least 4 characters (it has %(show_value)d).': 'กรุณากรอกรหัสผ่านอย่างน้อย 4 ตัวอักษร (คุณกรอก %(show_value)d ตัว)',
            'Ensure this value has at least 8 characters (it has %(show_value)d).': 'กรุณากรอกรหัสผ่านอย่างน้อย 8 ตัวอักษร (คุณกรอก %(show_value)d ตัว)',
            'Passwords do not match.': 'รหัสผ่านไม่ตรงกัน',
            'Enter a valid username.': 'กรุณากรอกชื่อผู้ใช้ที่ถูกต้อง',
            'This username is already taken.': 'ชื่อผู้ใช้นี้ถูกใช้ไปแล้ว',
            'This email is already registered.': 'อีเมลนี้ถูกลงทะเบียนไปแล้ว',
            'The two password fields didn’t match.': 'รหัสผ่านทั้งสองช่องไม่ตรงกัน',
            'Enter a valid date.': 'กรุณากรอกวันที่ที่ถูกต้อง',
            'Invalid date format.': 'รูปแบบวันที่ไม่ถูกต้อง',
            # Add form-specific error messages
            'This field may not be blank.': 'ฟิลด์นี้ไม่สามารถว่างเปล่าได้',
            'Ensure this value has at least 10 characters (it has %(show_value)d).': 'กรุณากรอกข้อมูลอย่างน้อย 10 ตัวอักษร (คุณกรอก %(show_value)d ตัว)',
            'Enter a valid time.': 'กรุณากรอกเวลาที่ถูกต้อง',
            'Select a valid choice.': 'กรุณาเลือกตัวเลือกที่ถูกต้อง',
            'This choice is not one of the available choices.': 'ตัวเลือกนี้ไม่ใช่หนึ่งในตัวเลือกที่มีอยู่',
        }

        return translations.get(errors, errors)
