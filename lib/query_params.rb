class QueryParams

  attr_accessor :model, :params, :order
  def initialize(model, params)
    @model = model
    @params = params
    @order = params[:order]
    @limit = params[:limit] || params[:per_page]
    @offset = params[:offset] || params[:page]
  end

  def limit
    @limit.to_i unless @limit.nil?
  end

  def offset
    @offset.to_i unless @offset.nil?
  end

  def build
    query = [ build_query_string ]
    query << build_query_array
    model.where(query.flatten(1)).order(order).offset(offset).limit(limit)
  end

  private
  def build_query_string
    query_string = filtered_params.collect do |param|
      "#{param_key(param)} #{query_operator(param)} #{question_mark(param)}"
    end
    query_string.join(" and ")
  end

  def build_query_array
    filtered_params.collect{ |param| param_value(param) }
  end

  def filtered_params
    params.except(:page, :per_page, :action, :controller, :format, :order,
      :limit, :offset)
  end

  def query_operator(param)
    if param_value(param).is_a?(Array)
      "IN"
    else
      model.columns_hash[param_key(param)].type == :string ? "~*" : "="
    end
  end

  def question_mark(param)
    param_value(param).is_a?(Array) ? "(?)" : "?"
  end

  def param_key(param)
    param_value(param).is_a?(Array) ? param[0].singularize : param[0]
  end

  def param_value(param)
    param[1]
  end
end
