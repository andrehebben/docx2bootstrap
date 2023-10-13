-- image-figure.lua

local function imageToFigure (elem)
  if elem.t == "Image" then
    local next_elem = pandoc.utils.stringify(elem):gsub("^%s*(.-)%s*$", "%1")  -- Get the text content of the next element
    if next_elem ~= "" then
      local figcaption = pandoc.Para({pandoc.Str(next_elem)})
      local figure = {
        t = "Div",
        attr = { class = "figure" },
        content = {
          elem,
          figcaption
        }
      }
      return figure
    end
  end
end

return {
  { Image = imageToFigure }
}
