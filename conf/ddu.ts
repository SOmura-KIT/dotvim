import { BaseConfig } from "https://deno.land/x/ddu_vim@v3.9.0/types.ts";
import { ConfigArguments } from "https://deno.land/x/ddu_vim@v3.9.0/base/config.ts";

export class Config extends BaseConfig {
  override config(args: ConfigArguments): Promise<void> {
    args.contextBuilder.patchGlobal({
      ui: "ff",
      uiParams: {
        ff: {
          filterFloatingPosition: "bottom",
          filterSplitDirection: "floating",
          floatingBorder: "rounded",
          previewFloating: true,
          previewFloatingBorder: "rounded",
          previewFloatingTitle: "Preview",
          previewSplit: "horizontal",
          prompt: "> ",
          split: "floating",
          startFilter: true,
        }
      },

      sourceOptions: {
        _: {
          matchers: [ "matcher_substring" ],
          ignoreCase: true,
        },
      },

      kindOptions: {
        _: {
          defaultAction: "open"
        },
        lsp: {
          defaultAction: "open",
        },
        lsp_codeAction: {
          defaultAction: "apply",
        },
      },
    });

    args.contextBuilder.patchLocal("file", {
      sources: [{
        name: "file",
        options: {
          converters: ["converter_devicon"]
        }
      }],
    });

    args.contextBuilder.patchLocal("file_recursive", {
      sources: [{
        name: "file_rec",
        options: {
          converters: ["converter_devicon"],
        },
        params: {
          ignoredDirectories: [ "node_modules", ".git", "dist", ".obsidian", ".trash"]
        },
      }],
    });

    args.contextBuilder.patchLocal("help", {
      sources: ["help"],
    });

    args.contextBuilder.patchLocal("ripgrep", {
      sources: [{
        name: "rg",
        options: {
          matchers: [],
          volatile: true,
          path: Deno.cwd(),
        }
      }],
      uiParams: {
        ff: {
          ignoreEmpty: false,
          autoResize: false,
        }
      }
    });

    args.contextBuilder.patchLocal("buffer", {
      sources: ["buffer"],
    });

    args.contextBuilder.patchLocal("lsp_definition", {
      sources: ["lsp_definition"],
      uiParams: {
        ff: {
          immediateAction: "open"
        }
      }
    });

    args.contextBuilder.patchLocal("lsp_definition", {
      sources: ["lsp_workspaceSymbol"],
      sourceOptions: {
        lsp: {
          volatile: true,
        }
      },
      uiParams: {
        ff: {
          ignoreEmpty: false
        }
      }
    });

    args.contextBuilder.patchLocal("lsp_codeAction", {
      sources: [{
        name: "lsp_callHierarchy",
        params: {
          method: "callHierarchy/outgoingCalls"
        }
      }],
      uiParams: {
        ff: {
          displayTree: true,
          startFilter: false,
        }
      }
    });

    return Promise.resolve();
  }
}
