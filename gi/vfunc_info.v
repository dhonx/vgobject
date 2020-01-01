module gi

// type gi__VFuncInfo CallableInfo

struct VFuncInfo {
	cai &CallableInfo
}

const (
	VFUNC_MUST_CHAIN_UP		= C.GI_VFUNC_MUST_CHAIN_UP
	VFUNC_MUST_OVERRIDE		= C.GI_VFUNC_MUST_OVERRIDE
	VFUNC_MUST_NOT_OVERRIDE	= C.GI_VFUNC_MUST_NOT_OVERRIDE
)

fn (vfi &VFuncInfo) get_flags() int {
	return g_vfunc_info_get_flags(vfi.cai.c)
}

fn (vfi &VFuncInfo) get_offset() int {
	return g_vfunc_info_get_offset(vfi.cai.c)
}

fn (vfi &VFuncInfo) get_signal() &SignalInfo {
	cptr := &GIBaseInfo(g_vfunc_info_get_signal(vfi.cai.c))
	if isnil(cptr) { return 0 }
	ptr := &BaseInfo{cptr}
	return &SignalInfo(ptr)
}

fn (vfi &VFuncInfo) get_invoker() &FunctionInfo {
	cptr := &GIBaseInfo(g_vfunc_info_get_invoker(vfi.cai.c))
	if isnil(cptr) { return 0 }
	ptr := &BaseInfo{cptr}
	return &FunctionInfo(ptr)
}

// gpointer g_vfunc_info_get_address 	(GIVFuncInfo *info,
//										GType implementor_gtype,
//                           			GError **error)


// gboolean g_vfunc_info_invoke (GIVFuncInfo *info,
//                      		GType implementor,
//                      		const GIArgument *in_args,
//                      		int n_in_args,
//                      		const GIArgument *out_args,
//                      		int n_out_args,
//                      		GIArgument *return_value,
//                      		GError **error)
