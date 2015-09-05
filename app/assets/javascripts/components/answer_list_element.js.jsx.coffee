# Answer List Element Component

@AnswerListElement = React.createClass
  displayName: 'Answer List Element'

  render: ->
    React.DOM.li null,
      React.DOM.div
        className: 'answer-element-body'
        @props.answer.body
        React.DOM.a
          className: 'upvote-link'
          href: "/answers/#{@props.answer.id}/upvote_answer"
          'data-remote': true
          React.DOM.i
            className: 'fa fa-thumbs-up'
        React.DOM.div
          className: 'upvote-label'
          "Total Upvotes:"
          React.DOM.div
            className: 'upvote-number'
            id: "upvote-number-#{@props.answer.id}"
            @props.answer.upvotes
        React.DOM.div
          className: 'answer-created-date'
          "Answered on: #{@props.answer.created_at}"
        React.DOM.hr null