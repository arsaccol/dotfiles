--require('gen').setup({
--  --model = "qwen2.5-coder",            -- The default model to use.
--  --model = "TheBloke/deepseek-coder-6.7B-instruct-GGUF",
--  debug = true,
--  model = "deepseek-r1:1.5b",
--  quit_map = "q",               -- set keymap to close the response window
--  retry_map = "<c-r>",          -- set keymap to re-send the current prompt
--  accept_map = "<c-cr>",        -- set keymap to replace the previous selection with the last result
--  host = "127.0.0.1",           -- The host running the Ollama service.
--  port = "11434",               -- The port on which the Ollama service is listening.
--  --port = "8080",               -- The port on which the Ollama service is listening.
--  display_mode = "horizontal-split",       -- The display mode. Can be "float" or "split" or "horizontal-split".
--  show_prompt = false,          -- Shows the prompt submitted to Ollama.
--  show_model = false,           -- Displays which model you are using at the beginning of your chat session.
--  no_auto_close = false,        -- Never closes the window automatically.
--  file = false,                 -- Write the payload to a temporary file to keep the command short.
--  hidden = false,               -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
--  -- init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
--  -- Function to initialize Ollama
--  command = function(options)
--    print("Running Gen with model " .. options.model)
--    local body = { model = options.model, stream = true }
--    return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
--  end,
--  -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
--  -- This can also be a command string.
--  -- The executed command must return a JSON object with { response, context }
--  -- (context property is optional).
--  -- list_models = '<omitted lua function>', -- Retrieves a list of model names
--  debug = false       -- Prints errors and the command which is run.
--
--})
--
--vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>')
--vim.keymap.set('v', '<leader>]', ':Gen Enhance_Grammar_Spelling<CR>')


require('gen').setup({
  model = "gemini-2.0-flash",
  debug = true,
  quit_map = "q",
  retry_map = "<c-r>",
  accept_map = "<c-cr>",
  display_mode = "horizontal-split",
  show_prompt = false,
  show_model = false,
  no_auto_close = false,
  file = false,
  hidden = false,

  command = function(options)
    local api_key = os.getenv("GEMINI_API_KEY")
    if not api_key then
      error("GEMINI_API_KEY not set")
    end

    local body = {
      contents = {
        {
          role = "user",
          parts = {
            { text = options.prompt }
          }
        }
      }
    }

    local json_body = vim.fn.json_encode(body)
    local escaped_body = vim.fn.shellescape(json_body)

    return string.format(
      [[curl -s -X POST "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generate?key=%s" -H "Content-Type: application/json" -d %s]],
      api_key,
      escaped_body
    )
  end,
})

vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>')
vim.keymap.set('v', '<leader>]', ':Gen Enhance_Grammar_Spelling<CR>')

