function Link(el)
  if el.target:match("^%[%[.-%]%]$") then
    local wikilink = el.target:sub(3, -3)
    return pandoc.Link(wikilink, wikilink .. ".html")
  end
end

