local first_level_one_header_seen = false

function Header(el)
  if el.level ~= 1 then
    return nil
  end

  if not first_level_one_header_seen then
    first_level_one_header_seen = true
    return el
  end

  return {
    pandoc.RawBlock("latex", "\\newpage"),
    el
  }
end
