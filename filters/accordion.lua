-- Custom function to create an accordion element
function createAccordion(title, content)
  local content_html = pandoc.utils.stringify(content)
  return pandoc.RawBlock("html", string.format([[
    <div class="accordion">
      <div class="accordion-item">
        <h2 class="accordion-header" id="heading%s">
          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse%s" aria-expanded="true" aria-controls="collapse%s">
            %s
          </button>
        </h2>
        <div id="collapse%s" class="accordion-collapse collapse show" aria-labelledby="heading%s">
          <div class="accordion-body">
            %s
          </div>
        </div>
      </div>
    </div>
  ]], title, title, title, title, title, title, content_html))
end

-- Custom Pandoc filter
function Pandoc(doc)
  local new_blocks = {}
  local current_accordion_title = nil
  local current_accordion_content = {}

  for _, block in ipairs(doc.blocks) do
    if block.t == "Header" then
      local level = block.level
      local title = pandoc.utils.stringify(block.content)

      if level >= 2 and level <= 5 then
        if current_accordion_title then
          -- Close the current accordion and start a new one
          table.insert(new_blocks, createAccordion(current_accordion_title, current_accordion_content))
          current_accordion_title = nil
          current_accordion_content = {}
        end
        current_accordion_title = title
      else
        table.insert(current_accordion_content, block)
      end
    else
      table.insert(current_accordion_content, block)
    end
  end

  -- Add the last accordion
  if current_accordion_title then
    table.insert(new_blocks, createAccordion(current_accordion_title, current_accordion_content))
  end

  return pandoc.Pandoc(new_blocks, doc.meta)
end
