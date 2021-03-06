module gi

pub struct UnionInfo {
	c &GIUnionInfo
}

pub fn (ui &UnionInfo) get_n_fields() int {
	return g_union_info_get_n_fields(ui.c)
}

pub fn (ui &UnionInfo) get_field(n int) &FieldInfo {
	cptr := &GIBaseInfo(g_union_info_get_field(ui.c, n))
	ptr := &BaseInfo{cptr}
	return &FieldInfo(ptr)
}

pub fn (ui &UnionInfo) get_n_methods() int {
	return g_union_info_get_n_methods(ui.c)
}

pub fn (ui &UnionInfo) get_method(n int) &FunctionInfo {
	cptr := &GIBaseInfo(g_union_info_get_method(ui.c, n))
	ptr := &BaseInfo{cptr}
	return &FunctionInfo(ptr)
}

pub fn (ui &UnionInfo) is_discriminated() bool {
	return g_union_info_is_discriminated(ui.c)
}

pub fn (ui &UnionInfo) discriminator_offset() int {
	return g_union_info_get_discriminator_offset(ui.c)
}

pub fn (ui &UnionInfo) discriminator_type() &TypeInfo {
	cptr := &GIBaseInfo(g_union_info_get_discriminator_type(ui.c))
	ptr := &BaseInfo{cptr}
	return &TypeInfo(ptr)
}

pub fn (ui &UnionInfo) get_discriminator(n int) &ConstantInfo {
	cptr := &GIBaseInfo(g_union_info_get_discriminator(ui.c, n))
	ptr := &BaseInfo{cptr}
	return &ConstantInfo(ptr)
}

pub fn (ui &UnionInfo) find_method(name string) &FunctionInfo {
	cptr := &GIBaseInfo(g_union_info_find_method(ui.c, name.str))
	if cptr == 0 { return 0 }
	ptr := &BaseInfo{cptr}
	return &FunctionInfo(ptr)
}

pub fn (ui &UnionInfo) get_size() u32 {
	return g_union_info_get_size(ui.c)
}

pub fn (ui &UnionInfo) get_alignment() u32 {
	return g_union_info_get_alignment(ui.c)
}
