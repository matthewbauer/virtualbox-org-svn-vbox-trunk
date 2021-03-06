/*
 * Copyright 2011 Apple Inc.
 *
 * All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation on the rights to use, copy, modify, merge,
 * publish, distribute, sublicense, and/or sell copies of the Software,
 * and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the
 * next paragraph) shall be included in all copies or substantial
 * portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NON-INFRINGEMENT.  IN NO EVENT SHALL RED HAT AND/OR THEIR SUPPLIERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

#ifndef __GLX_cmds_h__
#define __GLX_cmds_h__

extern int __glXBindSwapBarrierSGIX(__GLXclientState * cl, GLbyte * pc);
extern int __glXCreateContextWithConfigSGIX(__GLXclientState * cl, GLbyte * pc);
extern int __glXJoinSwapGroupSGIX(__GLXclientState * cl, GLbyte * pc);
extern int __glXMakeCurrentReadSGI(__GLXclientState * cl, GLbyte * pc);
extern int __glXQueryMaxSwapBarriersSGIX(__GLXclientState * cl, GLbyte * pc);
extern int __glXDoSwapBuffers(__GLXclientState * cl, XID drawId,
                              GLXContextTag tag);

extern Display *GetBackEndDisplay(__GLXclientState * cl, int s);
extern int GetCurrentBackEndTag(__GLXclientState * cl, GLXContextTag tag,
                                int s);

#endif                          /* !__GLX_cmds_h__ */
