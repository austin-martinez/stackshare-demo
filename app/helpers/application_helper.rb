module ApplicationHelper

  def company_names(tool, count=3)
    tool['companies'].map do |company|
      company['name']
    end.take(count).to_sentence
  end

end
