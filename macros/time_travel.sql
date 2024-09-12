{% macro time_travel(time_colname, number, date_part) %}
    {% if date_part == 'days' %}
        dateadd(day,{{ number }},{{ time_colname }})
    {% elif date_part == 'months' %}
        dateadd(month, {{ number }}, {{ time_colname }})
    {% elif date_part == 'years' %}
        dateadd(year, {{ number }},{{ time_colname }})
    {% else %}
        {% do exceptions.raise('Invalid date_part. Please use "days", "months", or "years".') %}
    {% endif %}
{% endmacro %}
