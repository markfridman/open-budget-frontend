define [
    'backbone',
    'scripts/appConfig'
  ], (Backbone, appConfig) ->
  class ChangeExplanation extends Backbone.Model

      defaults:
              year: null
              leading_item: null
              req_code: null
              req_id: null
              explanation: null

      requestId: ->
          if @get('req_id')?
              @get('req_id')
          else
              ret = ""+@get('req_code')
              while ret.length < 3
                      ret = "0"+ret
              ret = @get('leading_item')+'-'+ret
              while ret.length < 6
                      ret = "0"+ret
              ret

      fetch: ->
              super(dataType: appConfig.dataType)

      url: () => "#{appConfig.baseURL}/api/change_expl/#{@requestId()}/#{@get('year')}"

  return ChangeExplanation;
