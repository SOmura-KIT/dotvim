import { BaseConfig } from "https://deno.land/x/ddc_vim@v4.3.1/types.ts";
import { ConfigArguments } from "https://deno.land/x/ddc_vim@v4.3.1/base/config.ts";

export class Config extends BaseConfig {
  override async config(args: ConfigArguments): Promise<void> {
    args.contextBuilder.patchGlobal({
      ui: 'pum',
      autoCompleteEvents: [
        'InsertEnter',
        'TextChangedI',
        'TextChangedP',
        'TextChangedT',
        'CmdlineEnter',
        'CmdlineChanged',
      ],
      sources: ['skkeleton', 'vsnip', 'lsp', 'around', 'buffer', 'file'],
      cmdlineSources: {
        ':': ['cmdline', 'cmdline-history', 'around'],
        '@': ['cmdline-history', 'around'],
        '>': ['cmdline-history', 'around'],
        '/': ['around'],
        '?': ['around'],
        '-': ['around'],
        '=': [],
      },
      sourceOptions: {
        _: {
          maxItems: 10,
          matchers: ['matcher_fuzzy'],
          sorters: ['sorter_fuzzy'],
          converters: ['converter_fuzzy'],
        },
        around: {
          mark: '[ARW]',
        },
        buffer: {
          mark: '[BUF]',
        },
        cmdline: {
          mark: '[CMD]',
        },
        "cmdline-history": {
          mark: '[HST]',
          sorters: [],
        },
        copilot: {
          mark: '[GHC]',
          matchers: [],
          minAutoCompleteLength: 0,
        },
        file: {
          mark: '[FILE]'
        },
        lsp: {
          mark: '[LSP]',
          forceCompletionPattern: "\\.\\w*|::\\w*|->\\w*",
          dup: 'force',
        },
        skkeleton: {
          mark: '[SKK]',
          matchers: ['skkeleton'],
          sorters: [],
          minAutoCompleteLength: 1,
          isVolatile: true,
        },
        vsnip: {
          mark: '[VSN]',
        },
      },
      filterParams: {
        matcher_fuzzy: {
          splitMode: 'word',
        },
      },
    });
  }
}
