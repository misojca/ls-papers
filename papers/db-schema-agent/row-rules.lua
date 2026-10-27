-- Dodaje horizontalnu liniju (\midrule) izmedju redova tabela sa klasom
-- .row-rules, samo u LaTeX/PDF izlazu. Ostali formati se ne menjaju.
if not FORMAT:match('latex') then
  return {}
end

function Table(tbl)
  if not tbl.classes:includes('row-rules') then
    return nil
  end
  local tex = pandoc.write(pandoc.Pandoc({ tbl }), 'latex')
  local head, body, tail = tex:match('^(.-\\endlastfoot\n)(.-)(\\end{longtable}.*)$')
  if not body then
    return nil
  end
  -- Kraj reda tabele je " \\" na kraju linije; prelomi unutar celija nemaju razmak ispred.
  body = body:gsub(' \\\\\n', ' \\\\\n\\midrule\\noalign{}\n')
  body = body:gsub('\\midrule\\noalign{}\n$', '')
  return pandoc.RawBlock('latex', head .. body .. tail)
end
