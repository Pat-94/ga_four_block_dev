view: event_funnel_non_strict {
  extension: required

## Filters
  filter: event_1_non_strict_filter {
    view_label: "Event Funnel Non Strict"
    group_label: "Funnel Events"
    suggest_explore: sessions
    suggest_dimension: events.event_name
    description: "Event 1 to be used with Count of Event 1"
  }
  filter: event_2_non_strict_filter {
    view_label: "Event Funnel Non Strict"
    group_label: "Funnel Events"
    suggest_explore: sessions
    suggest_dimension: events.event_name
    description: "Event 2 to be used with Count of Event 2"
  }
  filter: event_3_non_strict_filter {
    view_label: "Event Funnel Non Strict"
    group_label: "Funnel Events"
    suggest_explore: sessions
    suggest_dimension: events.event_name
    description: "Event 3 to be used with Count of Event 3"
  }
  filter: event_4_non_strict_filter {
    view_label: "Event Funnel Non Strict"
    group_label: "Funnel Events"
    suggest_explore: sessions
    suggest_dimension: events.event_name
    description: "Event 4 to be used with Count of Event 4"
  }
  filter: event_5_non_strict_filter {
    view_label: "Event Funnel Non Strict"
    group_label: "Funnel Events"
    suggest_explore: sessions
    suggest_dimension: events.event_name
    description: "Event 5 to be used with Count of Event 5"
  }
  filter: event_6_non_strict_filter {
    view_label: "Event Funnel Non Strict"
    group_label: "Funnel Events"
    suggest_explore: sessions
    suggest_dimension: events.event_name
    description: "Event 6 to be used with Count of Event 6"
  }

## Dimensions

  dimension: event_1_non_strict_rank {
    type: number
    hidden: yes
    # Tag as 1 if one instance of event 1 filter exists
    sql: (select MIN(event_rank) from UNNEST(${sessions.event_data}) where {% condition event_1_non_strict_filter %} event_name {% endcondition %}) ;;
  }
  dimension: event_2_non_strict_rank {
    type: number
    hidden: yes
    # Tag as 1 if one instance of event 1 filter exists
    sql: (select MIN(event_rank) from UNNEST(${sessions.event_data}) where {% condition event_2_non_strict_filter %} event_name {% endcondition %} AND event_rank > ${event_1_non_strict_rank}) ;;
  }
  dimension: event_3_non_strict_rank {
    type: number
    hidden: yes
    # Tag as 1 if one instance of event 1 filter exists
    sql: (select MIN(event_rank) from UNNEST(${sessions.event_data}) where {% condition event_1_non_strict_filter %} event_name {% endcondition %} AND event_rank > ${event_2_non_strict_rank}) ;;
  }
  dimension: event_4_non_strict_rank {
    type: number
    hidden: yes
    # Tag as 1 if one instance of event 1 filter exists
    sql: (select MIN(event_rank) from UNNEST(${sessions.event_data}) where {% condition event_2_non_strict_filter %} event_name {% endcondition %} AND event_rank > ${event_3_non_strict_rank}) ;;
  }
  dimension: event_5_non_strict_rank {
    type: number
    hidden: yes
    # Tag as 1 if one instance of event 1 filter exists
    sql: (select MIN(event_rank) from UNNEST(${sessions.event_data}) where {% condition event_1_non_strict_filter %} event_name {% endcondition %} AND event_rank > ${event_4_non_strict_rank}) ;;
  }
  dimension: event_6_non_strict_rank {
    type: number
    hidden: yes
    # Tag as 1 if one instance of event 1 filter exists
    sql: (select MIN(event_rank) from UNNEST(${sessions.event_data}) where {% condition event_2_non_strict_filter %} event_name {% endcondition %} AND event_rank > ${event_5_non_strict_rank}) ;;
  }

  dimension: event_1_non_strict_tag {
    type: number
    hidden: yes
    sql: case when ${event_1_non_strict_rank} is not null then 1 else 0 end ;;
  }
  dimension: event_2_non_strict_tag {
    type: number
    hidden: yes
    sql: case when ${event_2_non_strict_rank} is not null then 1 else 0 end ;;
  }
  dimension: event_3_non_strict_tag {
    type: number
    hidden: yes
    sql: case when ${event_3_non_strict_rank} is not null then 1 else 0 end ;;
  }
  dimension: event_4_non_strict_tag {
    type: number
    hidden: yes
    sql: case when ${event_4_non_strict_rank} is not null then 1 else 0 end ;;
  }
  dimension: event_5_non_strict_tag {
    type: number
    hidden: yes
    sql: case when ${event_5_non_strict_rank} is not null then 1 else 0 end ;;
  }
  dimension: event_6_non_strict_tag {
    type: number
    hidden: yes
    sql: case when ${event_6_non_strict_rank} is not null then 1 else 0 end ;;
  }


## Measures
  measure: count_of_event_1_non_strict {
    view_label: "Event Funnel Non Strict"
    type: sum
    sql: ${event_1_non_strict_tag} ;;
    label: "{% if event_1_non_strict_filter._in_query %}
    {{_filters['event_1_non_strict_filter']}}
    {% else %}
    Count of Event 1 Non Strict
    {% endif %}"
    description: "Count of Event 1 to be used with Event 1 filter, if no filter is selected it shows all events"
  }

  measure: count_of_event_2_non_strict {
    view_label: "Event Funnel Non Strict"
    type: sum
    sql: ${event_2_non_strict_tag} ;;
    label: "{% if event_2_non_strict_filter._in_query %}
    {{_filters['event_2_non_strict_filter']}}
    {% else %}
    Count of Event 2 Non Strict
    {% endif %}"
    description: "Count of Event 2 to be used with Event 2 filter, if no filter is selected it shows all events"
  }

  measure: count_of_event_3_non_strict {
    view_label: "Event Funnel Non Strict"
    type: sum
    sql: ${event_3_non_strict_tag} ;;
    label: "{% if event_3_non_strict_filter._in_query %}
    {{_filters['event_3_non_strict_filter']}}
    {% else %}
    Count of Event 3 Non Strict
    {% endif %}"
    description: "Count of Event 3 to be used with Event 3 filter, if no filter is selected it shows all events"
  }

  measure: count_of_event_4_non_strict {
    view_label: "Event Funnel Non Strict"
    type: sum
    sql: ${event_4_non_strict_tag} ;;
    label: "{% if event_4_non_strict_filter._in_query %}
    {{_filters['event_4_non_strict_filter']}}
    {% else %}
    Count of Event 4 Non Strict
    {% endif %}"
    description: "Count of Event 4 to be used with Event 4 filter, if no filter is selected it shows all events"
  }

  measure: count_of_event_5_non_strict {
    view_label: "Event Funnel Non Strict"
    type: sum
    sql: ${event_5_non_strict_tag} ;;
    label: "{% if event_5_non_strict_filter._in_query %}
    {{_filters['event_5_non_strict_filter']}}
    {% else %}
    Count of Event 5 Non Strict
    {% endif %}"
    description: "Count of Event 5 to be used with Event 5 filter, if no filter is selected it shows all events"
  }

  measure: count_of_event_6_non_strict {
    view_label: "Event Funnel Non Strict"
    type: sum
    sql: ${event_6_non_strict_tag} ;;
    label: "{% if event_6_non_strict_filter._in_query %}
    {{_filters['event_6_non_strict_filter']}}
    {% else %}
    Count of Event 6 Non Strict
    {% endif %}"
    description: "Count of Event 6 to be used with Event 6 filter, if no filter is selected it shows all events"
  }
}
