from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import Faq
from import_export import widgets, fields, resources
from import_export.admin import ImportExportModelAdmin #for downloading csv-file
from import_export.admin import ImportExportActionModelAdmin #to chose a file format
from core.models import Faq
#from core.utils import print_result

admin.site.site_header = 'Автофакер'

class FaqResource(resources.ModelResource):
    model = Faq

class FaqAdmin(ImportExportModelAdmin):
    list_display = ('id', 'title', 'answer',)
    search_fields = ('title',)

    def queryset(self, request):
        qs = super(FaqAdmin, self).queryset(request)
        # modify queryset here, eg. only user-assigned tasks
        qs.filter(assigned__exact=request.user)
        return qs

    def get_search_results(self, request, queryset, search_term):
            # search_term is what you input in admin site
            # queryset is search results
            queryset, use_distinct = super(FaqAdmin, self).get_search_results(request, queryset, search_term)
            a = request.GET.get("q", '')

            print(queryset)
            #print(print_result(a))

            return queryset, use_distinct


admin.site.register(Faq, FaqAdmin)