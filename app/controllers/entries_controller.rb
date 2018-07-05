class EntriesController < ApplicationController
  def index
    # @entries = SourceReference.all
    render cms_page: '/shell-budget'
  end
end
