# Questions Component

@Questions = React.createClass
  displayName: 'Questions'

  getInitialState: ->
    questions: @props.data

  getDefaultProps: ->
    questions: []

  addQuestion: (question) ->
    console.log question
    console.log @state.questions
    questions = @state.questions.slice()
    questions.push question
    @setState questions: questions
    console.log @state.questions

  render: ->
    React.DOM.div
      className: 'questions-list'
      React.DOM.h2
        className: 'title'
        'Questions'
      React.DOM.hr null
      React.DOM.table
        className: 'questions-table'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.td null, 'Subject'
            React.DOM.td null, 'Number of Answers'
            React.DOM.td null, 'Top Answer Upvotes'
        React.DOM.tbody null,
          for question in @state.questions
            React.createElement QuestionRow, key: question.id, question: question
      React.createElement QuestionForm, handleNewQuestion: @addQuestion