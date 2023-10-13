#!/usr/bin/env python
import panflute as pf

def remove_image_style(elem, doc):
    if isinstance(elem, pf.Image) and 'style' in elem.attributes:
        del elem.attributes['style']

def main(doc=None):
    return pf.run_filter(remove_image_style, doc=doc)

if __name__ == '__main__':
    main()