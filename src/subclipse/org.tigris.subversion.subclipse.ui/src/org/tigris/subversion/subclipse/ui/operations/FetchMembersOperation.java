/*******************************************************************************
 * Copyright (c) 2005, 2006 Subclipse project and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Subclipse project committers - initial API and implementation
 ******************************************************************************/
package org.tigris.subversion.subclipse.ui.operations;

import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.team.core.TeamException;
import org.eclipse.ui.IWorkbenchPart;
import org.eclipse.ui.progress.IElementCollector;
import org.tigris.subversion.subclipse.core.ISVNRemoteFolder;
import org.tigris.subversion.subclipse.core.ISVNRemoteResource;
import org.tigris.subversion.subclipse.core.Policy;
import org.tigris.subversion.subclipse.core.SVNException;
import org.checkerframework.checker.guieffect.qual.*;

/**
 * Fetch the members of a remote folder in the background, passing incremental
 * results through an IElementCollector.
 */
public class FetchMembersOperation extends SVNOperation {

	IElementCollector collector;
	ISVNRemoteFolder remoteFolder;

	public FetchMembersOperation(IWorkbenchPart part, ISVNRemoteFolder folder, IElementCollector collector) {
		super(part);
		this.remoteFolder = folder;
		this.collector = collector;
	}

	@UIEffect protected void execute(IProgressMonitor monitor) throws SVNException, InterruptedException { // Colin Gordon: necessary invalid override: only called exlicitly (via run()) from a UI context, not properly used as an Operation.
		monitor = Policy.monitorFor(monitor);
		try {
			monitor.beginTask(Policy.bind("FetchMembersOperation.message", remoteFolder.getName()), 100);
			ISVNRemoteResource[] children = remoteFolder.members(Policy.subMonitorFor(monitor, 95));
			collector.add(children, Policy.subMonitorFor(monitor, 5));
		} catch (TeamException e) {
			throw SVNException.wrapException(e);
		} finally {
			monitor.done();
		}
	}

	protected String getTaskName() {
		return Policy.bind("FetchMembersOperation.taskName", remoteFolder.getName());
	}

}
