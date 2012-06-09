atom_feed :language => "es-AR", :root_url => noticias_path do |feed|
  feed.title("Noticias Emprender")
  feed.updated(@noticias.first.updated_at) if @noticias.length > 0

  @noticias.each do |noticia|
    feed.entry(noticia) do |entry|
      entry.title(noticia.titulo)
      entry.summary(noticia.resumen)
      entry.content(noticia.texto, :type => 'html')

      entry.author do |author|
        author.name(noticia.autor.nombre_completo)
        author.email(noticia.autor.email)
      end
    end
  end
end
