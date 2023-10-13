function find_image_caption(elem)
    if elem.t == "Image" then
        return elem.caption
    elseif elem.t == "Para" then
        local caption_content = {}
        local has_image = false

        for _, inline in ipairs(elem.content) do
            if inline.t == "Image" then
                has_image = true
            else
                table.insert(caption_content, inline)
            end
        end

        if has_image then
            return pandoc.Figure(
                { pandoc.Image(nil, elem.content[1].content[1].attributes.src, elem.content[1].content[1].attributes.alt) },
                pandoc.Span(caption_content)
            )
        end
    end
end


function Doc(body)
    local new_blocks = {}
    for _, elem in ipairs(body) do
        local result = find_image_caption(elem)
        if result then
            table.insert(new_blocks, result)
        else
            table.insert(new_blocks, elem)
        end
    end
    return pandoc.Doc(new_blocks)
end

return {
    { Doc = Doc }
}