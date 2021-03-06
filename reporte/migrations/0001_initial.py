# -*- coding: utf-8 -*-
# Generated by Django 1.10.3 on 2016-11-06 14:50
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ReporteProducto',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=100, null=True)),
                ('inicio', models.DateField()),
                ('fin', models.DateField()),
                ('tipo', models.IntegerField(choices=[(1, 'Diaria'), (2, 'Mensual'), (3, 'Anual')])),
            ],
            options={
                'verbose_name': 'Reporte Producto',
                'verbose_name_plural': 'Reporte Productos',
            },
        ),
    ]
