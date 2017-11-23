class ArticlesController < ApplicationController

  def new
    @articles = Article.new
  end

  def create
    @articles = Article.new(article_params)
    #A opção flash[:notice] usada a seguir é similar as mensagens de sucesso ou erro que aparecem após salvar alguma coisa.
    if @articles.save 
      flash[:notice] = "Article was sucessfully created"
      redirect_to article_path(@articles)
    else
      #caso não esteja de acordo com as validações a aplicação ficara na página "new" apresentando as devidas mensagens de erro.
      render 'new'
    end
  end

  def show
    #para apresentar a pagina "show" com as informações do artigo criado e mensagens, é necessários criar a views/articles/show.html.erb
    @articles = Article.find(params[:id])
  end


  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end