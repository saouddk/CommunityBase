# Question row Component

@QuestionRow = React.createClass
  displayName: 'Question Row'

  render: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.a
          className: 'question-link'
          href: "/questions/#{@props.question.id}"
          @props.question.subject
      React.DOM.td null, @props.question.number_of_answers
      React.DOM.td null, @props.question.number_of_upvotes_for_top_answer