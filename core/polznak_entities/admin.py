from django.contrib import admin

from . import models

admin.site.register(models.InterestArea)
admin.site.register(models.Language)

class ProfileAdmin(admin.ModelAdmin):
    list_display = ('__str__', 'user')


admin.site.register(models.Profile, ProfileAdmin)
admin.site.register(models.Post)
admin.site.register(models.Conversation)
admin.site.register(models.Message)
admin.site.register(models.MessageSeenByProfile)
admin.site.register(models.Comment)
admin.site.register(models.UserOpinion)
admin.site.register(models.Grades)
