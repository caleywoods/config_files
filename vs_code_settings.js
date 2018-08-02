{
    // Some of these are VS Code default but adding here in case they change.

    // EDITOR SETTINGS

    // Misc visual tweaks
    "editor.lineHeight": 22,

    // Font Settings
    "editor.fontFamily": "Dank Mono",
    "editor.fontSize": 15,
    "editor.fontLigatures": true,

    // Indentation
    "editor.tabSize": 4,
    "editor.insertSpaces": true,
    "editor.detectIndentation": false,
    "editor.renderIndentGuides": true,

    "editor.hover.delay": 0,

    // Settings for Trailing Spaces Plugin
    "trailing-spaces.highlightCurrentLine": false,
    "trailing-spaces.trimOnSave": true,
    "trailing-spaces.liveMatching": true,

    // Editor version of trim trailing \w+ on save
    "files.trimTrailingWhitespace": true,

    // Disable insertion of newline on save
    "files.insertFinalNewline": false,

    // Change multi cursor key modifier from alt to Ctrl / Command
    "editor.multiCursorModifier": "ctrlCmd",

    // Cursor Settings - Show thick caret and phase blink
    // This is currently set to line since I use the vscodevim plugin and
    // want to tell between block and insert
    "editor.cursorStyle": "line",
    "editor.cursorBlinking": "phase",

    // Show ruler at 80 cols
    "editor.rulers": [80],

    // Disable wrapping
    "editor.wordWrap": "off",

    // Scroll past EOF
    "editor.scrollBeyondLastLine": true,

    // Enable minimap and show code blocks instead of characters
    "editor.minimap.enabled": true,
    "editor.minimap.renderCharacters": false,

    // Highlight all matching symbols
    "editor.occurrencesHighlight": true,

    // Enable code folding
    "editor.folding": true,

    // Highlight matching bracket on select
    "editor.matchBrackets": true,

    // No drag and drop for you
    "editor.dragAndDrop": false,

    // Relative line numbering
    "editor.lineNumbers": "relative",

    // WINDOW SETTINGS

    // On re-open restore all instances of VS Code that had folders open
    "window.restoreWindows": "folders",

    // EXPLORER SETTINGS

    // Turn off the open editors pane.
    "explorer.openEditors.visible": 1,

    // PHP LINTING

    // Validate PHP in realtime
    "php.validate.run": "onType",

    // TELEMETRY SETTINGS

    // ET Phone home, off
    "telemetry.enableTelemetry": false,

    // GIT SETTINGS

    // Path to the git executable
    "git.path": "C:\\Program Files\\Git\bin\\git.exe",

    // WORKBENCH SETTINGS

    // Neither of these are installed by default
    "workbench.colorTheme": "One Monokai",
    "workbench.iconTheme": "vscode-icons",
    "workbench.colorCustomizations": {
        "editorIndentGuide.activeBackground": "#ff0000"
    },

    // Don't open welcome page or blank page when VS Code opens
    "workbench.startupEditor": "none",

    // Turn off the activity bar
    "workbench.activityBar.visible": false,
    "window.menuBarVisibility": "default",

    "vsicons.dontShowNewVersionMessage": true,
    "extensions.ignoreRecommendations": false,
    "vsicons.projectDetection.autoReload": true,
    "terminal.integrated.shell.windows": "C:\\Program Files\\Git\\bin\\bash.exe",

    // Extension Settings

    // VSCodeVim stuff

    // Incremental search
    "vim.incsearch": true,
    // Highlight search results
    "vim.hlsearch": true,
    "vim.searchHighlightColor": "rgba(255, 81, 223, 0.3)",

    // Hack to fix vimcode autoexpanding folded lines
    "vim.foldfix": false,

    // Let vsCodeVim use ctrl keys
    "vim.useCtrlKeys": true,

    // Turn off smart case which overrides case insensitivity if
    // your search pattern contains uppercase chars
    "vim.smartcase": false,

    // Prefix commands with : in the command pallette
    "vim.leader": "<space>",

    // bind jj to <Esc> in insert mode
    "vim.insertModeKeyBindings": [
        {
            "before": ["j", "j"],
            "after": ["<Esc>"]
        }
    ],
    // Turn on vim-easymotion
    "vim.easymotion": true,

    // Neovim integration
    "vim.enableNeovim": false,
    "vim.neovimPath": "C:\\Program Files\\Neovim\\bin\\nvim",

    "vim.handleKeys": {
        "<C-d>": false
    },

    // Twig Language 2
    "files.associations": {
        "*.html": "twig"
    },
    "emmet.includeLanguages": {
        "twig": "html"
    },

    // Bracketpair colorizer
    "bracketPairColorizer.forceIterationColorCycle": true,
}