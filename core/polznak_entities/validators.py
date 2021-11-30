from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _

def grade_validator(value: int):
    if not isinstance(value, int):
        raise ValidationError(_("Value must be integer"))
    if value < 1 or value > 5:
        raise ValidationError(_('Value %d must be in range [1, 5]' % value))
