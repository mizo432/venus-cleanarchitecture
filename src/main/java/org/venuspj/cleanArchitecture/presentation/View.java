package org.venuspj.cleanArchitecture.presentation;

/**
 * View.
 * @param <D> ViewModelの型
 */
public interface View<D> {
    View<D> setViewModel(D viewModel);
}
