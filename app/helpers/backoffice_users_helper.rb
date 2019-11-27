module BackofficeUsersHelper
  def translate_attribute(object = nil, method = nil)
    (object && method) ? object.model.human_attribute_name(method) : "Informe o atributo a ser traduzido"
  end
end
