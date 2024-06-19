local function compileAndRun()
    local inputFile = vim.fn.expand '%'
    local outputFile = vim.fn.expand '%<'
    local compiler = 'g++'
    local libs = { 'fmt' }
    local linkedLibs = ''
    for i = 1, #libs do
        linkedLibs = linkedLibs .. '-l' .. libs[i] .. ' '
    end
    local runFile = outputFile
    if string.sub(runFile, 1, 1) ~= '/' then
        runFile = './' .. outputFile
    end
    local cmd = string.format('%s -std=c++11 %s -o %s %s && %s', compiler, inputFile, outputFile, linkedLibs, runFile)
    vim.cmd 'write'
    vim.cmd('horizontal term ' .. cmd)
end

vim.keymap.set('n', '<leader>\\', function()
    compileAndRun()
end, {
    desc = 'Run current C++ file inside Terminal',
    buffer = true,
})
