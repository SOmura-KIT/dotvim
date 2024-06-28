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
      sources: ['skkeleton', 'around'],
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
        skkeleton: {
          mark: '[SKK]',
          matchers: ['skkeleton'],
          sorters: [],
          minAutoCompleteLength: 1,
          isVolatile: true,
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
