atom_feed :language => "es-AR", :root_url => eventos_path do |feed|
  feed.title("Eventos Emprender")
  feed.updated(@eventos.first.updated_at) if @eventos.length > 0

  @eventos.each do |evento|
    feed.entry(evento) do |entry|
      entry.title(evento.nombre)
      entry.summary(evento.resumen)
      entry.content(evento.descripcion, :type => 'html')

      entry.author do |author|
        author.name(evento.autor.nombre_completo)
        author.email(evento.autor.email)
      end
    end
  end
end
