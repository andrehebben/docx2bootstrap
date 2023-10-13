local chapter_number = 0
local section_number = {}
local subsection_number = {}
local subsubsection_number = {}
local skip_heading1 = false

-- Function to check if an element is empty
local function is_empty(elem)
    return elem.content and #elem.content == 0
end

function Header(elem)
    if is_empty(elem) then
        return pandoc.RawBlock('html', '') -- Use an empty HTML block to effectively remove the element
    end

    chapter_number = chapter_number or 0
    section_number[chapter_number] = section_number[chapter_number] or 0
    subsection_number[chapter_number] = subsection_number[chapter_number] or 0
    subsubsection_number[chapter_number] = subsubsection_number[chapter_number] or 0

    if elem.level == 1 then
        if skip_heading1 then
            skip_heading1 = false
            return elem
        else
            chapter_number = chapter_number + 1
            elem.content = pandoc.List(pandoc.Str(chapter_number .. ". ")) .. elem.content
            section_number[chapter_number] = 0
            subsection_number[chapter_number] = 0
            subsubsection_number[chapter_number] = 0
        end
    else
        if elem.level == 2 then
            section_number[chapter_number] = section_number[chapter_number] + 1
            elem.content = pandoc.List(pandoc.Str(chapter_number .. "." .. section_number[chapter_number] .. ". ")) .. elem.content
        elseif elem.level == 3 then
            subsection_number[chapter_number] = subsection_number[chapter_number] + 1
            elem.content = pandoc.List(pandoc.Str(chapter_number .. "." .. section_number[chapter_number] .. "." .. subsection_number[chapter_number] .. ". ")) .. elem.content
        elseif elem.level == 4 then
            subsubsection_number[chapter_number] = subsubsection_number[chapter_number] + 1
            elem.content = pandoc.List(pandoc.Str(chapter_number .. "." .. section_number[chapter_number] .. "." .. subsection_number[chapter_number] .. "." .. subsubsection_number[chapter_number] .. ". ")) .. elem.content
        end
    end
    return elem
end

return {
    { Header = Header }
}
