# Question Form Component

@QuestionForm = React.createClass
  displayName: 'Question Form'

  getInitialState: ->
    subject: ''
    body: ''

  handleChange: (e) ->
    if e.target.name is 'subject'
      #Subject is being changed, lets show similar questions to user
      @getSimilarQuestions e

    #Handle change normally and set state
    name = e.target.name
    @setState "#{ name }": e.target.value

  showSuggestions: (data) ->
    suggestions_box_dom = $('.suggestions-box')

    if data and data.length
      suggestions = ''
      for question in data
        suggestions += "<a href='/questions/#{question.id}'>#{question.subject}</a><br>"

      suggestions_box_dom.html suggestions
      suggestions_box_dom.fadeIn()
    else
      suggestions_box_dom.fadeOut()


  getSimilarQuestions: (e) ->
    $.get "/similar_questions?subject=#{e.target.value}", (data) =>
      @showSuggestions data
    , 'json'

  valid: ->
    @state.subject && @state.body

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/questions', { question: @state }, (data) =>
      @props.handleNewQuestion data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.div
      className: 'new-question-form'
      React.DOM.h3
        className: 'title'
        'Ask a Question'
      React.DOM.form
        className: 'form-horizontal'
        onSubmit: @handleSubmit
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control subject-input'
            placeholder: 'Subject'
            name: 'subject'
            value: @state.subject
            onChange: @handleChange
        React.DOM.div
          className: 'suggestions-box'
        React.DOM.div
          className: 'form-group'
          React.DOM.textarea
            className: 'form-control body-input'
            rows: 5
            placeholder: 'Your Question Specifics'
            name: 'body'
            value: @state.body
            onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Ask Question'