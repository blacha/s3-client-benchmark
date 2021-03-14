'use strict';
const indent = (level) => '  '.repeat(level);
/**
 * Virtual Node for storing `sgml` style documents
 **/
class VNode {
  /**
   * Convert a virtual dom node to sgml text
   * @param level current indentation level
   */
  toString(level = 0) {
    return indent(level) + '[VNode]';
  }
}
exports.VNode = VNode;
/**
 * Virtual Text Node for storing text leaf nodes
 **/
class VNodeText extends VNode {
  constructor(text) {
    super();
    this.text = text;
  }
  toString(level = 0) {
    return indent(level) + this.text;
  }
}
exports.VNodeText = VNodeText;
/**
 * Virtual Element Node for storing tagged elements
 **/
class VNodeElement extends VNode {
  constructor(tag, attrs, children) {
    super();
    this.tag = tag;
    this.attrs = attrs;
    this.children = children;
  }

  toString(level = 0) {
    const attrs = this.toStringAttrs();
    const padding = indent(level);
    const children = this.toStringChildren(level);
    const result = `${padding}<${this.tag}${attrs}`;
    if (children === '') return `${result} />`;
    return `${result}>${children}</${this.tag}>`;
  }

  toStringAttrs() {
    const keys = Object.keys(this.attrs);
    if (keys.length === 0) {
      return '';
    }
    let out = '';
    for (const key of keys) {
      const val = this.attrs[key];
      if (val == null) continue;
      out += ` ${key}="${val}"`;
    }
    return out;
  }
  toStringChildren(level = 0) {
    if (this.children.length === 0) return '';
    if (this.children.length === 1) {
      const n1 = this.children[0];
      if (n1 instanceof VNodeText) return n1.text;
    }
    return `\n${this.children.map((c) => c.toString(level + 1)).join(`\n`)}\n${indent(level)}`;
  }

  toXml() {
    return `<?xml version="1.0" encoding="UTF-8"?>` + this.toString();
  }
}
exports.VNodeElement = VNodeElement;
/**
 * Validate and convert all children to VNodes
 *
 * @param children input to validate and convert
 */
function normalizeChildren(children) {
  if (children == null) {
    return [];
  }
  if (Array.isArray(children)) {
    const childNodes = [];
    for (const c of children) {
      if (c == null) continue;
      if (typeof c === 'string' || typeof c === 'number') {
        childNodes.push(new VNodeText(String(c)));
        continue;
      }
      childNodes.push(c);
    }
    return childNodes;
  } else if (typeof children === 'string' || typeof children === 'number') {
    return [new VNodeText(String(children))];
  }
  return [children];
}
function V(tag, arg1, children) {
  const hasAttrs = typeof arg1 === 'object' && !Array.isArray(arg1);
  if (!hasAttrs) {
    if (children != null) throw new Error('Invalid input');
    children = arg1;
  }
  return new VNodeElement(tag, hasAttrs ? arg1 : {}, normalizeChildren(children));
}
exports.V = V;
