# Base16 Sass

The Base16 color schemes (107) converted to Sass modules, ready to be used in projects.

- https://github.com/tajmone/Base16-Sass

Copyright © 2019, [Tristano Ajmone].


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Introduction](#introduction)
    - [The YAML Schemes](#the-yaml-schemes)
    - [The SCSS Schemes](#the-scss-schemes)
    - [Bare vs Named Schemes](#bare-vs-named-schemes)
- [Building the SCSS Modules](#building-the-scss-modules)
- [System Requirements](#system-requirements)
- [About Base16](#about-base16)
- [Credits and License](#credits-and-license)

<!-- /MarkdownTOC -->

-----

# Introduction

Since I work often on documentation projects that involve syntax highlighting, and because the Base16 color schemes collection is so beautiful, I decided to create this repository so that I would always have a Sass module ready available for every Base16 scheme.

## The YAML Schemes

This projects automates the conversion of all 107 Base16 schemes from YAML to Sass/SCSS, via Mustache templates.

- [`/schemes/`][schemes] — source YAML Base16 schemes.

## The SCSS Schemes

All the Base16 schemes are already available in the repository as Sass/SCSS modules, there is no need to convert them from YAML (but there is a [`build.sh`][build] script for doing it, if you need to).

There are two different Sass versions for each scheme:

- [`/scss-bare/`][scss-bare] — SCSS with fixed variables naming.
- [`/scss-named/`][scss-named] — SCSS with variables named after the scheme.

Every module is named after its original YAML scheme:

|        yaml       |        scss        |
|-------------------|--------------------|
| `<filename>.yaml` | `_<filename>.scss` |

## Bare vs Named Schemes

The Sass modules in the `scss-bare/` folder define the color schemes using a fixed variable naming convention:

```scss
$base00: #171c19;
$base01: #232a25;
$base02: #526057;
$base03: #5f6d64;
$base04: #78877d;
$base05: #87928a;
$base06: #dfe7e2;
$base07: #ecf4ee;
$base08: #b16139;
$base09: #9f713c;
$base0A: #a07e3b;
$base0B: #489963;
$base0C: #1c9aa0;
$base0D: #478c90;
$base0E: #55859b;
$base0F: #867469;
```

While the modules in the `scss-named/` folder include the color scheme name in the variables identifiers:

```scss
$Atelier-Savanna-00: #171c19;
$Atelier-Savanna-01: #232a25;
$Atelier-Savanna-02: #526057;
$Atelier-Savanna-03: #5f6d64;
$Atelier-Savanna-04: #78877d;
$Atelier-Savanna-05: #87928a;
$Atelier-Savanna-06: #dfe7e2;
$Atelier-Savanna-07: #ecf4ee;
$Atelier-Savanna-08: #b16139;
$Atelier-Savanna-09: #9f713c;
$Atelier-Savanna-0A: #a07e3b;
$Atelier-Savanna-0B: #489963;
$Atelier-Savanna-0C: #1c9aa0;
$Atelier-Savanna-0D: #478c90;
$Atelier-Savanna-0E: #55859b;
$Atelier-Savanna-0F: #867469;
```

... where the variable identifier is taken from the scheme name (not the filename) and spaces are substituted with hyphens.

The former are useful in Sass projects which rely on a fixed naming convention for the Base16 variables, which is more than enough if your project uses a single Base16 scheme, while the latter is useful when you need multiple Base16 schemes to cohexist and be globally available with unique identifiers.

Sometimes it's easier to work with the former, especially for projects using a single Base16 scheme, as you only need to replace the module defining the actual colors to affect results, without having to rename variables, or you can just keep redefining the scheme variables during compilation, to produce different results using the same mixins or file imports.

But other times the context will require the scheme variables to be kept available during the whole Sass compilation, so you'll need the latter if you're working with multiple schemes and you want them to be uniquely identified and persistent.

Whichever your needs, this repository can provide you with a quick drop-in Sass/SCSS module for every Base16 scheme.


# Building the SCSS Modules

To convert the Base16 YAML schemes, I've taken a custom approach instead of using one of on the official [base16 builders]. This approach has both pros and cons, so others might prefer to use the mustache templates of this project with a Base16 builder instead.

There were various reasons why I didn't want to use an official base16 builder:

1. I dediced to add a extra `url` variable to the YAML schemes, pointing to the repository the scheme was downloaded from, so that it could be included in the final SCSS module.

2. My mustache templates are designed for the original (old) base16 naming convention — which is the one still used in most color schemes found around the web — while most builders use the newer conventions (base16 `v0.8.0`–`v0.9.0`), which rely on a different naming convention for template variables.

3. I had already done the above steps for the __[highlight-extras]__ project, so the base material was ready for reuse — I only needed to add an extra `id` key to each scheme, to be used for naming the variables.

For the above reasons, a custom workflow seemed a better idea. The downside is that the base16 schemes have to be updated manually, by checking from time to time if new schemes were added to the list.

In the future, I might try to find a better solution; but right now I'm quite satisfied that this approach allowed the creation of 107 Base16 Sass modules at once, without too much effort or the need to install extra tools.


# System Requirements

If you're only interested in using the Sass schemes, you don't need to setup anything, for these are already available in the repository. But if you want to convert them yourself, just run the build script:

- [`./build.sh`][build]

You'll need two Node.js CLI tools:

- __[mustache.js]__ (by Jan Lehnardt) — JavaScript implementation of [mustache].
- __[yaml-utils]__ (by Christopher Brown) — to convert from YAML to JSON.

In order to build the themes via the scripts in this project, you'll need to install these two packages globally on your machine (obviously, you'll need [Node.js] too).

Of course, you can instead use any mustache tool of your choice to convert the schemes, the `*.mustache` templates will work with any mustache implementation.


# About Base16

- http://chriskempson.com/projects/base16/

From the [base16 homepage]:

> \[Base16 is\] an architecture for building themes based on carefully chosen syntax highlighting using a base of sixteen colours. Base16 provides a set of guidelines detailing how to style syntax and how to code a _builder_ for compiling base16 _schemes_ and _templates_.

# Credits and License

The YAML Base16 schemes inside the [`schemes/`][schemes] folder were taken and adapted from [Chris Kempson]'s __[Base16 Builder]__ project (deprecated), with the exception of a few schemes which were colleted from other sources (indicated in the `url` key added to every scheme).

This project is therefore released under the same license of the original schemes, the MIT License:

```
MIT License

Copyright (c) 2019 Tristano Ajmone <tajmone@gmail.com>
https://github.com/tajmone/Base16-Sass

Copyright (c) 2012 Chris Kempson (http://chriskempson.com)
https://github.com/chriskempson/base16-builder

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS                                
------------------------------------------------------------------------------>

<!--------------------------- Internal Repo Links ---------------------------->

<!-- files  -->

[build]: ./build.sh "View file"

<!-- folders -->

[schemes]: ./schemes/ "Navigate to folder"
[scss-bare]: ./scss-bare/ "Navigate to folder"
[scss-named]: ./scss-named/ "Navigate to folder"

<!--------------------------- External References ---------------------------->

[mustache]: https://mustache.github.io/ "Visit mustache website"

<!-- Base16 Builder Upstream -->

[Base16 Builder]: https://github.com/chriskempson/base16-builder "Visit the Base16 Builder on GitHub"

<!-- Base16 Official -->

[base16 homepage]: http://chriskempson.com/projects/base16/ "Visit base16 homepage"
[base16 repository]: https://github.com/chriskempson/base16 "Visit base16 project on GitHub"
[base16 project]: https://github.com/chriskempson/base16 "Visit base16 project on GitHub"
[base16 builders]: https://github.com/chriskempson/base16#builder-repositories
[Base16 Styling Guidelines]: http://chriskempson.com/projects/base16/#styling-guidelines "Read the Base16 Styling Guidelines"

[Scheme Repositories]: https://github.com/chriskempson/base16#scheme-repositories "See the list of Scheme Repositories mentioned in the base16 official project"
[dce99f6]: https://github.com/chriskempson/base16/blob/dce99f6/README.md#scheme-repositories

[highlight-extras]: https://gitlab.com/tajmone/highlight-extras "View the highlight-extras repository on GitLab"

<!-- Dependencies -->

[mustache.js]: https://www.npmjs.com/package/mustache "Visit 'mustache.js' page on NPM"
[yaml-utils]: https://www.npmjs.com/package/yaml-utils "Visit 'yaml-utils' page on NPM"
[Node.js]: https://nodejs.org/ "Visit Node.js website"

<!-- People -->

[Chris Kempson]: https://github.com/chriskempson "View Chris Kempson's GitHub profile"
[Tristano Ajmone]: https://github.com/tajmone "View Tristano Ajmone's GitHub profile"

<!-- EOF -->