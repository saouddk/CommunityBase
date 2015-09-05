# Answer Form Component

@AnswerForm = React.createClass
  displayName: 'Answer Form'

  getInitialState: ->
    body: ''
    question_id: @props.question.id

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.body

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/answers', { answer: @state }, (data) =>
      @props.handleNewAnswer data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.div
      className: 'new-answer-form'
      React.DOM.form
        className: 'form-horizontal'
        onSubmit: @handleSubmit
        React.DOM.div
          className: 'form-group'
          React.DOM.textarea
            className: 'form-control body-input'
            rows: 5
            placeholder: 'Your Answer'
            name: 'body'
            value: @state.body
            onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Add Answer'