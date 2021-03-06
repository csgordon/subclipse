/*******************************************************************************
 * Copyright (c) 2010 Subclipse project and others.
 * Copyright (c) 2010 Red Hat, Inc.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Subclipse project committers
 *     Red Hat, Inc. - initial API and implementation
 ******************************************************************************/
package org.tigris.subversion.subclipse.tools.usage.tracker;

import java.io.UnsupportedEncodingException;

import org.tigris.subversion.subclipse.tools.usage.tracker.internal.IFocusPoint;

/**
 * Interface for the URL building strategy
 */
public interface IURLBuildingStrategy {

	public String build(IFocusPoint focusPoint) throws UnsupportedEncodingException;

}
