# Generated by Django 2.2.13 on 2020-10-05 18:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("licenses", "0006_auto_20200924_1343"),
    ]

    operations = [
        migrations.AlterModelOptions(
            name="translationbranch",
            options={"verbose_name_plural": "translation branches"},
        ),
        migrations.AlterField(
            model_name="translationbranch",
            name="complete",
            field=models.BooleanField(default=False),
        ),
    ]