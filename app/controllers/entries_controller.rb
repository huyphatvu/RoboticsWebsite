class EntriesController < ApplicationController
  def index
    @entries = SourceReference.all
    # render cms_page: '/entries'
  end
end
