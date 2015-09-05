# Question Component

@Question = React.createClass
  displayName: 'Question'

  getInitialState: ->
    question: @props.data
    answers: @props.answers

  addAnswer: (answer) ->
    answers = @state.answers.slice()
    answers.push answer
    @setState answers: answers

  render: ->
    React.DOM.div
      className: 'question-view'
      React.DOM.h3
        className: 'question-subject'
        @state.question.subject
      React.DOM.div
        className: 'question-created-date'
        "Asked on: #{@state.question.created_at}"
      React.DOM.div
        className: 'question-body'
        @state.question.body
      React.DOM.div
        className: 'question-views-label'
        "Views: #{@state.question.views}"
      React.DOM.hr null
      React.DOM.h4
        className: 'title'
        'Answers:'
      React.DOM.ul
        className: 'question-answers-list'
        for answer in @state.answers
          React.createElement AnswerListElement, key: answer.id, answer: answer
      React.createElement AnswerForm, handleNewAnswer: @addAnswer, question: @state.question
