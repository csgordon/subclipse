#!/bin/bash
export PATH=$CHECKERFRAMEWORK/checker/bin:$PATH

JARS=

#ECLIPSEJARS="/usr/lib/eclipse/plugins/org.eclipse.ui.navigator_3.5.100.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.ui.ide_3.7.0.dist.jar:/usr/lib/eclipse/dropins/jdt/plugins/org.eclipse.jdt.ui_3.7.0.dist.jar:/usr/lib/eclipse/dropins/jdt/plugins/org.eclipse.jdt.core_3.7.0.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.ui.navigator.resources_3.4.300.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.debug.core_3.7.0.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.debug.ui_3.7.0.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.core.resources_3.7.100.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.swt.gtk.linux.x86_64_3.7.0.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.ui_3.7.0.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.swt_3.7.0.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.jface_3.7.0.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.core.commands_3.6.0.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.ui.workbench_3.7.0.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.core.runtime_3.7.0.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.osgi_3.7.0.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.equinox.common_3.6.0.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.core.jobs_3.5.100.dist.jar:/usr/lib/ecliplse/plugins/org.eclipse.core.runtime.compatibility.registry_3.5.0.dist/runtime_registry_compatibility.jar:/usr/lib/eclipse/plugins/org.eclipse.equinox.registry_3.5.100.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.equinox.preferences_3.4.0.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.core.contenttype_3.4.100.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.equinox.app_1.3.100.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.ui.forms_3.5.100.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.ui.workbench.texteditor_3.7.0.dist.jar:/usr/lib/eclipse/plugins/org.eclipse.core.net_1.2.100.dist.jar"
ECLIPSEJARS="/usr/share/java/ant.jar:/usr/lib/eclipse/dropins/jdt/plugins/org.eclipse.jdt.debug_3.7.0.dist/jdimodel.jar:`ls /usr/lib/eclipse/plugins/*.jar /usr/lib/eclipse/dropins/jdt/plugins/*.jar /homes/gws/csgordon/.eclipse/org.eclipse.platform_3.7.0_155965261/plugins/*.jar | tr "\n" :`:/homes/gws/csgordon/research/experiments/timed/jvmmonitor/jvmmonitor-read-only/org.jvmmonitor.ui/lib/org.swtchart_0.8.0.v20120301.jar"



DEBUG= #"-AprintErrorStack -Afilenames -Ashowchecks" #-Alint=debugSpew"
ERRS=9999

COMMAND="javac -encoding ISO-8859-1 -Xmaxerrs $ERRS -cp $ECLIPSEJARS -processor org.checkerframework.checker.guieffect.GuiEffectChecker $DEBUG"

echo $COMMAND

#JAVAFILES=`find . -name "*.java"`
# We need to manually omit some subdirectories that declare duplicate classes:
# - subclipse/org.tigris.subversion.clientadapter.svnkit
JAVAFILES="subclipse/org.tigris.subversion.clientadapter subclipse/org.tigris.subversion.clientadapter.feature subclipse/org.tigris.subversion.clientadapter.javahl subclipse/org.tigris.subversion.clientadapter.javahl.feature subclipse/org.tigris.subversion.clientadapter.javahl.win32 subclipse/org.tigris.subversion.clientadapter.javahl.win64 subclipse/org.tigris.subversion.clientadapter.svnkit.feature subclipse/org.tigris.subversion.subclipse.core subclipse/org.tigris.subversion.subclipse.doc subclipse/org.tigris.subversion.subclipse.feature subclipse/org.tigris.subversion.subclipse.graph subclipse/org.tigris.subversion.subclipse.graph.feature subclipse/org.tigris.subversion.subclipse.graph.test subclipse/org.tigris.subversion.subclipse.tests subclipse/org.tigris.subversion.subclipse.tools.usage subclipse/org.tigris.subversion.subclipse.ui subclipse/org.tigris.subversion.subclipse.update-site"

#echo $JAVAFILES

pushd ~/research/guitypes/checker && ant dist && popd && find $JAVAFILES -name '*.java' | xargs $COMMAND;
